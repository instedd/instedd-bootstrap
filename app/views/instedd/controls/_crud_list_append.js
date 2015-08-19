<%= render("instedd/flash_messages") %>
$('#<%=create_id%>').before("<%= escape_javascript(render(partial, {model: model}))%>").collapse('hide');
$('#<%=create_id%> .create_partial').html("<%= escape_javascript(render create_partial, { model: create_model } ) %>");
