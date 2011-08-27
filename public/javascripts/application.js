base_uri = "";
rm_uri = "http://dss-rm.dev";

$(function() {
  $("#to_tokens").tokenInput(rm_uri + "/api/search.json", {
    crossDomain: true,
    //prePopulate: $("#to_tokens").data("pre"),
    theme: "adminus"
  });
});
