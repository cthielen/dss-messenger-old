base_uri = "";

$(function() {
  $("#to_tokens").tokenInput(base_uri + "/people.json", {
    crossDomain: false,
    prePopulate: $("#group_people_tokens").data("pre"),
    theme: "adminus"
  });
});
