$( function() {
 

$("#dialog-form").dialog({
    autoOpen: false,
    height: 230,
    width: 350,
    modal: true,
    appendTo: "form",
    open: function (type, data) {
        $(this).parent().appendTo("form");
    }
   
});


$('#Popup').click(function () {
    $("#dialog-form").dialog('open');
    return false;
});
});

function closereplydialog() { $("#dialog-form").dialog("close"); }