base_uri = "";
rm_uri = "http://dss-rm.dev";

$(function() {
  $("#to_tokens").tokenInput(base_uri + "/site/search.json", {
    crossDomain: false,
    //prePopulate: $("#to_tokens").data("pre"),
    theme: "adminus"
  });
});
