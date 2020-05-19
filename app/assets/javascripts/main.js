
// Add turblolink load to called the javascript even if it redirect from link
$(document).on('turbolinks:load', function () {
    "use strict";

    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        event.preventDefault();
        debugger
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }
        debugger;

        // Invoke AJAX call to store the user data when fields are properly validated
        if (check){
                $.ajax({
                type: "POST",
                url: "/api/v1/users",
                data: $(this).serialize(),
                success: function (data, textStatus, jqXHR) {
                    alert(data.success);
                    window.location.href = window.location.href;
                },
                error: function (data, textStatus, jqXHR) {
                    window.location.href = window.location.href;
                }
            });
        }
        else{
            return false
        }
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    

});