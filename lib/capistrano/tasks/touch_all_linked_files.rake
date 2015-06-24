namespace :deploy do
  namespace :check do

    # desc 'Touches all linked files'
    task :touch_all_linked_files do
      on release_roles :all do
        fetch(:linked_files, []).each do |file|
          target = shared_path.join(file)
          unless test("[ -f #{target} ]")
            execute :touch, target
            info "Touched : #{target}"
          end
        end
      end
    end
  end
  before 'deploy:check:linked_files', 'deploy:check:touch_all_linked_files'

end
