module FatLinode
  class LinodeApi
    attr_accessor :api_key, :node_name, :public_ip

    def initialize(args)
      @api_key = args[:api_key]
      @node_name = args[:node_name]
      @public_ip = args[:public_ip]
    end

    def private_ips
      all_ips.collect {|ip| ip.ipaddress if private?(ip)}.compact
    end

    def private_ip
      node_ips.detect{|ip| private?(ip)}
    end

    def node_private_ip
      if private_ip
        private_ip.ipaddress 
      else
        warn "no private_ip issued on this linode"
      end
    end

    def node_public_ip
      node_ips.detect{|ip| private?(ip) == false}.ipaddress
    end

    def node_gateway
      array = node_public_ip.split(".")
      array[-1] = "1"
      array.join(".")
    end

    def node_ips
      if detect_linode_by_label 
        find_ips(:LinodeId => detect_linode_by_label.linodeid)
      elsif detect_lionde_by_public_ip
        find_ips(:LinodeId => detect_lionde_by_public_ip.linodeid)
      else  
         warn "Cannot detect the linode you are deploying"
      end
    end

    private

    def conn
      @conn ||= Linode.new(:api_key => api_key)
    end

    def linode
      begin
        conn.linode
      rescue
        raise "Could not connect to linode's api!"
      end
    end

    def find_ips(linodeid)
      linode.ip.list(linodeid)
    end

    def all_ips
      linode.ip.list
    end

    def private?(ip_instance)
      ip_instance.ispublic.zero?
    end

    def detect_linode_by_label
      @detected ||= linode.list.detect{|l| l.label == node_name} if node_name
    end
    
    def detect_lionde_by_public_ip 
      @detected ||= linode.ip.list.detect{|ip| ip.ipaddress == public_ip} if public_ip
    end

  end
end
