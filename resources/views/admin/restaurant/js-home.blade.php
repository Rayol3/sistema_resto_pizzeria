<script>
    Inputmask("9{2}[-]9{2}", {
        placeholder: "-",
        greedy: false
    }).mask('#horario');

    function load_country() {
        $.ajax({
            url         : "{{ route('admin.load_country') }}",
            method      : "POST",
            data        : {
                '_token': "{{ csrf_token() }}"
            },
            success     : function(r){
                if (!r.status) {
                    toast_msg(r.msg, r.type);
                    return;
                }

                let idpais      = r.restaurant.idpais,
                    countries   = r.countries,
                    html        = '<option></option>';

                $.each(countries, function(index, country) {
                    html += `<option value="${country.id}">${country.descripcion}</option>`;
                });    
                if(idpais == null) {
                    $('select[name="idpais"]').html(html).select2({
                        placeholder     : "[SELECCIONE]",
                    });
                } else {
                    $('select[name="idpais"]').html(html).select2();
                    $('select[name="idpais"]').val(idpais).change();
                }
            },
            dataType    : "json"
        });
    }

    load_country();

    $('body').on('click', '.btn-save-info', function() {
        event.preventDefault();
        let form = new FormData($('#form-info')[0]);
        $.ajax({
            url: "{{ route('admin.save_info_rest') }}",
            method: "POST",
            data: form,
            processData: false,
            contentType: false,
            cache: false,
            beforeSend: function() {
                $('.btn-save-info').prop('disabled', true);
                $('.text-save-info').addClass('d-none');
                $('.text-saving-info').removeClass('d-none');
            },
            success: function(r) {
                if (!r.status) {
                    $('.btn-save-info').prop('disabled', false);
                    $('.text-save-info').removeClass('d-none');
                    $('.text-saving-info').addClass('d-none');
                    toast_msg(r.msg, r.type);
                    return;
                }

                $('.btn-save-info').prop('disabled', false);
                $('.text-save-info').removeClass('d-none');
                $('.text-saving-info').addClass('d-none');
                $('#form-info input[name="logo_encabezado"]').val('');
                $('#form-info input[name="logo_principal"]').val('');
                $('#form-info input[name="banner"]').val('');
                load_country();
                toast_msg(r.msg, r.type);
            },
            dataType: 'json'
        });
    });

    $('.image-publicities').MultiFile({
        accept  :'png|jpg',
        max     :10,
        STRING  : {
            remove:'Remover',
            selected:'Selecionado: $file',
            denied:'Archivo de entrada no válido (.$ext)',
            duplicate:'Archivo ya seleccionado:\n$file!'
        }
    });
</script>
