include_recipe 'fat-linode::default'

linode = FatLinode::LinodeApi.new(:api_key => node['fat-linode']['api_key'], :node_name => node.name, :public_ip => node['cloud']['public_ips'].first)

#check for chef-solo or if node.name fails to match linode label or if a private ip has not been issued.
unless Chef::Config[:solo] || linode.node_ips.nil?
  template '/etc/network/interfaces' do 
    source 'interfaces.erb'
    variables(:private_ip => linode.node_private_ip, 
      :public_ip => linode.node_public_ip, 
      :gateway => linode.node_gateway)
    notifies :restart, 'service[networking]', :immediately
  end
end 

service 'networking' do
  supports :restart => true
end
