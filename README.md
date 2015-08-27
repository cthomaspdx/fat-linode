fat-linode Cookbook
===================
TODO: Enter the cookbook description here.

e.g.
This cookbook makes your favorite breakfast sandwich.

Requirements
------------
recipe::static_ip 
configures /etc/network/interfaces for debian. This will write a private ip to the interfaces file if a private ip is issued.
e.g.
#### packages
- `toaster` - fat-linode needs toaster to brown your bagel.

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### fat-linode::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['fat-linode']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### fat-linode::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `fat-linode` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[fat-linode]"
  ]
}
```

Contributing
------------
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
