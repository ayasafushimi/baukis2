function toggle_home_address_fields() {
    const checked = $("input#form_inputs_home_address").prop("checked");
    $("fieldset#home-address-fields").toggle(checked);
}

function toggle_work_address_fields() {
    const checked = $("input#form_inputs_work_address").prop("checked");
    $("fieldset#work-address-fields").toggle(checked);
}

$(document).on("turbolinks:load", () => {
    toggle_home_address_fields();
    toggle_work_address_fields();
    $("input#form_inputs_home_address").on("click", () => {
        toggle_home_address_fields();
    });
    $("input#form_inputs_work_address").on("click", () => {
        toggle_work_address_fields();
    });
});