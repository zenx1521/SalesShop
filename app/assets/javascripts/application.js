// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require react
//= require react_ujs
//= require components
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require bootstrap

$(document).ready(function() {
  $("#searchForm").submit(event => {
    event.preventDefault();
    let shopItemSearch = {};
    const choosenCategory = $(".category")[0].value;
    shopItemSearch.choosen_category = choosenCategory;
    const choosenMinPrice = $(".minPrice")[0].value;
    const choosenMaxPrice = $(".maxPrice")[0].value;
    if (choosenMinPrice != "") {
      shopItemSearch.choosen_min_price = choosenMinPrice;
    }
    if (choosenMaxPrice != "") {
      shopItemSearch.choosen_max_price = choosenMaxPrice;
    }
    //const parsified = JSON.stringify(shopItemSearch);

    $.ajax({
      url: "shop_items/v1/search",
      type: "GET",
      data: { shop_item_data: shopItemSearch },
      success: function(data) {
        const parsified = JSON.parse(data);

        $(".container").remove();

        const container = document.createElement("div");

        container.className = "container";

        for (let i = 0; i < Math.ceil(parsified.length / 3); i++) {
          let partialArray = parsified.slice(i * 3, (i + 1) * 3);
          const row = document.createElement("div");
          row.className = "row shop_items_holder";
          for (j = 0; j < partialArray.length; j++) {
            let shop_item_js = document.createElement("div");
            shop_item_js.className = "col-3 shop_item_holder";
            shop_item_js.textContent = partialArray[i].title;

            row.appendChild(shop_item_js);
          }
          container.appendChild(row);
        }

        $(".main-content")[0].appendChild(container);
        $(container)
          .hide()
          .appendTo(".main-content")
          .fadeIn(1000);
      }
    });
  });
  const bucket_items = $(".add_to_bucket");
  const bucket_delete_buttons = $(".remove_from_bucket");
  for (let i = 0; i < bucket_items.length; i++) {
    $(bucket_items[i]).click(event => {
      let amount = prompt("Please choose amount");
      let item_id = event.target.dataset.id;
      $.ajax({
        url: "bucket_items/",
        type: "POST",
        data: { amount: amount, item_id: item_id },
        headers: {
          "X-CSRF-Token": $('meta[name="csrf-token"]').attr("content")
        }
      });
    });
  }

  for (let i = 0; i < bucket_delete_buttons.length; i++) {
    $(bucket_delete_buttons[i]).click(event => {
      let id_to_delete = event.target.dataset.id;
      $.ajax({
        url: "bucket_items/" + id_to_delete,
        type: "DELETE",
        headers: {
          "X-CSRF-Token": $('meta[name="csrf-token"]').attr("content")
        }
      });
    });
  }

  $("#pay").click(event => {
    $.ajax({
      url: "buckets/",
      type: "POST",
      headers: {
        "X-CSRF-Token": $('meta[name="csrf-token"]').attr("content")
      }
    });
  });
});
