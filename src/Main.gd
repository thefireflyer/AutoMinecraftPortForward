extends Control

var upnp

var port1 = 25566 
var port2 = 25575

func _ready():
	
	upnp = UPNP.new()
	
	upnp.discover(2000, 2, "InternetGatewayDevice")
	upnp.add_port_mapping(port1)
	upnp.add_port_mapping(port2)
	
	$Label.text = "ports forwarded, close to remove port forwards"

func _exit_tree():
	upnp.delete_port_mapping(port1)
	upnp.delete_port_mapping(port2)
