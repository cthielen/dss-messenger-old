//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree ./common

base_uri = "";
rm_uri = "http://dss-rm.dev";

$(function() {
  $("#to_tokens").tokenInput(base_uri + "/search.json", {
    crossDomain: false,
    prePopulate: $("#to_tokens").data("pre"),
    theme: "adminus"
  });

  $("select#template_select").change(function() {
    var template_id = $(this).val();
    // Selecting the 'blank' dropdown yields a 0 ...
    if(template_id) {
      $.get(base_uri + "/templates/" + template_id + ".json", function(obj, success) {
        if(success == "success") {
          var body = obj.body;
          var subject = obj.subject;
          
          $("input#message_subject").val(subject);
          $("textarea.wysiwyg").wysiwyg("setContent", body);
        }
      });
    }
    
  });
});
