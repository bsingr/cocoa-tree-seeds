class PodSpecDependencyUpdater
  def update pod_spec
    if cocoa_pod = CocoaPod.find(pod_spec.name)
      pod_spec.dependencies.each do |d|
        if dependency = CocoaPod.find(d.name)
          cocoa_pod.dependencies << {
            name: dependency.name,
            requirement: d.requirement.to_s
          }
          cocoa_pod.save!
          dependency.dependents << {
            name: cocoa_pod.name,
            requirement: d.requirement.to_s
          }
          dependency.save!
        end
      end
    end
  end
end
