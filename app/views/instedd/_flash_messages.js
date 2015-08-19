<%
keys = { :notice => 'flash_notice', :error => 'flash_error', :alert => 'flash_error' }
keys.each do |key, value|
  if msg = flash.now[key]
%>
    $.status.show("<%= escape_javascript(msg) %>", '<%= value %>', 3000);
<%
  end
end
%>
