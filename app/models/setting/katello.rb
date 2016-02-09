class Setting::Katello < Setting
  def self.load_defaults
    return unless super

    self.transaction do
      [
        self.set('katello_default_provision', N_("Default provisioning template for new Operating Systems"), 'Katello Kickstart Default'),
        self.set('katello_default_finish', N_("Default finish template for new Operating Systems"), 'Katello Kickstart Default Finish'),
        self.set('katello_default_user_data', N_("Default user data for new Operating Systems"), 'Katello Kickstart Default User Data'),
        self.set('katello_default_PXELinux', N_("Default PXElinux template for new Operating Systems"), 'Kickstart default PXELinux'),
        self.set('katello_default_iPXE', N_("Default iPXE template for new Operating Systems"), 'Kickstart default iPXE'),
        self.set('katello_default_ptable', N_("Default partitioning table for new Operating Systems"), 'Kickstart default'),
        self.set('content_action_accept_timeout', N_("Time in seconds to wait for a Host to pickup a remote action"), 20),
        self.set('content_action_finish_timeout', N_("Time in seconds to wait for a Host to finish a remote action"), 3600),
        self.set('restrict_composite_view', N_("If set to true, a composite content view may not be published or "\
                 "promoted, unless the component content view versions that it includes exist in the target environment."),
                 false),
        self.set('pulp_sync_node_action_accept_timeout', N_("Time in seconds to wait for a pulp node to remote action"), 20),
        self.set('pulp_sync_node_action_finish_timeout', N_("Time in seconds to wait for a pulp node to finish sync"), 12.hours.to_i),
        self.set('check_services_before_actions', N_("Whether or not to check the status of backend services such as pulp and candlepin prior to performing some actions."), true),
        self.set('force_post_sync_actions', N_("Force post sync actions such as indexing and email even if no content was available."), false),
        self.set('default_download_policy', N_("Default download policy for repositories (either 'immediate', 'on_demand', or 'background')"), "on_demand"),
        self.set('pulp_export_destination', N_("On-disk location for exported repositories"), File.join(Rails.root, 'repo-exports'))
      ].each { |s| self.create! s.update(:category => "Setting::Katello") }
    end
    true
  end
end
