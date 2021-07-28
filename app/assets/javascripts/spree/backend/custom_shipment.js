/* global shipments, variantStockTemplate, order_number */
// Shipments AJAX API
$(document).ready(function () {
    function createTrackingValueContent(data) {
        if (data.tracking_link) {
            return '<a target="_blank" href="' + data.tracking_link + '">' + data.carrier + ' ' + data.tracking + '<a>'
        }
        var selectedShippingMethod = data.shipping_methods.filter(function (method) {
            return method.id === data.selected_shipping_rate.shipping_method_id
        })[0]

        if (selectedShippingMethod && selectedShippingMethod.tracking_url) {
            var shipmentTrackingUrl = selectedShippingMethod.tracking_url.replace(/:tracking/, data.tracking)
            return '<a target="_blank" href="' + shipmentTrackingUrl + '">' + data.tracking + '<a>'
        }

        return data.tracking
    }

    // handle tracking save
    $('[data-hook=admin_shipment_form] a.save-tracking-carrier').on('click', function (event) {
        event.preventDefault()
        var link = $(this)
        var shipmentNumber = link.data('shipment-number')
        var tracking = link.parents('tbody').find('input#tracking').val()
        var carrier = link.parents('tbody').find('#carrier').val()
        var url = Spree.url(Spree.routes.shipments_api + '/' + shipmentNumber + '.json')
        $.ajax({
            type: 'PUT',
            url: url,
            data: {
                shipment: {
                    tracking: tracking,
                    carrier: carrier
                },
                token: Spree.api_key
            }
        }).done(function (data) {
            link.parents('tbody').find('tr.edit-tracking').toggle()

            var show = link.parents('tbody').find('tr.show-tracking')
            show.toggle()

            if (data.tracking) {
                show.find('.tracking-value').html($('<strong>').html(Spree.translations.tracking + ': ')).append(createTrackingValueContent(data))
            } else {
                show.find('.tracking-value').html(Spree.translations.no_tracking_present)
            }
        })
    })
})

document.addEventListener('DOMContentLoaded', function () {
    $('.with-popover').each(function () {
        $(this).popover({
            html: true,
            sanitize: false,
        })

        $(this).click(function () {
            return false;
        })
    })

    $('.with-popover').on('show.bs.popover', function (event) {
        if (('ontouchstart' in window)) {
            event.preventDefault()
        }
    })
})
