// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function show_full_image_popup()
{
	var div = document.getElementById("full_image_container");
	var body = document.getElementById("body");
	var show = (div.className == "container_hidden" && body.className == "body_scrolling");
	
	if(show == true)
	{
		div.className = "container_visible";
		body.className = "body_no_scrolling";
	}
	else
	{
		div.className = "container_hidden";
		body.className = "body_scrolling";
	}
}