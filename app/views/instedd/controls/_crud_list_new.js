<%
create_id = controller._crud_create_id(key)
%>
<%= render("instedd/flash_messages") %>
$('#<%=create_id%> .create_partial').html("<%= escape_javascript(render partial: controller._crud_list_option(key, :new), locals: { model: model } ) %>");
