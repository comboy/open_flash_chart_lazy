namespace :open_flash_chart_lazy do
  PLUGIN_ROOT = File.dirname(__FILE__) + '/../'
  
  # avoid warning in newer version of rails, and stay compatible with older ones
  rails_root =  (Object.const_defined?('Rails') && Rails.respond_to?(:root)) ?
      Rails.root : RAILS_ROOT

  
  desc 'Installs required swf in public/ and javascript files to the public/javascripts directory.'
  task :install do
    FileUtils.cp Dir[PLUGIN_ROOT + '/assets/swf/*.swf'], File.join(rails_root,'public')
    FileUtils.cp Dir[PLUGIN_ROOT + '/assets/javascripts/*.js'], File.join(rails_root,'public/javascripts')
  end
  desc 'Removes the swf and javascripts for the plugin.'
  task :remove do
    FileUtils.rm %w{json2.js swfobject.js}.collect { |f| File.join(rails_root,"public/javascripts",f)  }
    FileUtils.rm %{open-flash-chart.swf}.collect { |f| File.join(rails_root,"public",f)  }
  end
end
