<script>
    $('body').on('click', '.btn-create', function()
    {
        event.preventDefault();
        $('#modalAddCountry').modal('show');
    });

    $('body').on('click', '.btn-save', function()
    {
        event.preventDefault();
        let form            = $('#form_save').serialize(),
            descripcion     = $('#form_save input[name="descripcion"]'),
            prefijo         = $('#form_save input[name="prefijo"]'),
            codigo_telefono = $('#form_save input[name="codigo_telefono"]'),
            signo           = $('#form_save input[name="signo"]'),
            moneda          = $('#form_save input[name="moneda"]');

        if(descripcion.val() == '')
            descripcion.addClass('is-invalid');
        else
            descripcion.removeClass('is-invalid');

        if(prefijo.val() == '')
            prefijo.addClass('is-invalid');
        else
            prefijo.removeClass('is-invalid');

        if(codigo_telefono.val() == '')
            codigo_telefono.addClass('is-invalid');
        else
            codigo_telefono.removeClass('is-invalid');

        if(signo.val() == '')
            signo.addClass('is-invalid');
        else
            signo.removeClass('is-invalid');

        if(moneda.val() == '')
            moneda.addClass('is-invalid');
        else
            moneda.removeClass('is-invalid');

        if(descripcion.val().trim() != '' && prefijo.val().trim() != '' && codigo_telefono.val().trim() != '' && signo.val().trim() != '' && moneda.val().trim() != '')
        {
            $.ajax({
                url         :  "{{ route('admin.save_country') }}",
                method      : 'POST',
                data        : form,
                beforeSend  : function(){
                    $('.btn-save').prop('disabled', true);
                    $('.text-saving').removeClass('d-none');
                    $('.text-save').addClass('d-none');
                },
                success     : function(r)
                {
                    if(!r.status)
                    {
                        $('.btn-save').prop('disabled', false);
                        $('.text-saving').addClass('d-none');
                        $('.text-save').removeClass('d-none');
						toast_msg(r.msg, r.type);
                        return;
                    }

                    $('#modalAddCountry').modal('hide');
                    $('#form_save').trigger('reset');
                    $('.btn-save').prop('disabled', false);
                    $('.text-save').removeClass('d-none');
                    $('.text-saving').addClass('d-none');
                    toast_msg(r.msg, r.type);
                    reload_table();
                },
                dataType    : 'json'
            });
            return;
        }
    });

    $('body').on('click', '.btn-detail', function()
    {
        event.preventDefault();
        let id  = $(this).data('id');
        $.ajax({
            url         : "{{ route('admin.detail_country') }}",
            method      : 'POST',
            data        : {'_token' : "{{ csrf_token() }}",id: id},
            beforeSend  : function(){
                block_content('#layout-content');
            },
            success     : function(r){
                if(!r.status)
                {
                    close_block('#layout-content');
                    toast_msg(r.msg, r.type);
                    return;
                }
                close_block('#layout-content');
                $('#form_edit input[name="id"]').val(r.country.id);
                $('#form_edit input[name="descripcion"]').val(r.country.descripcion);
                $('#form_edit input[name="prefijo"]').val(r.country.prefijo);
                $('#form_edit input[name="codigo_telefono"]').val(r.country.codigo_telefono);
                $('#form_edit input[name="signo"]').val(r.country.signo);
                $('#form_edit input[name="moneda"]').val(r.country.moneda);
                $('#modalEditCountry').modal('show');
            },
            dataType    : 'json'
        });
        return;
    });

    $('body').on('click', '.btn-store', function()
    {
        event.preventDefault();
        let form            = $('#form_edit').serialize(),
            descripcion     = $('#form_edit input[name="descripcion"]'),
            prefijo         = $('#form_edit input[name="prefijo"]'),
            codigo_telefono = $('#form_edit input[name="codigo_telefono"]'),
            signo           = $('#form_edit input[name="signo"]'),
            moneda          = $('#form_edit input[name="moneda"]');

        if(descripcion.val() == '')
            descripcion.addClass('is-invalid');
        else
            descripcion.removeClass('is-invalid');

        if(descripcion.val() == '')
            descripcion.addClass('is-invalid');
        else
            descripcion.removeClass('is-invalid');

        if(prefijo.val() == '')
            prefijo.addClass('is-invalid');
        else
            prefijo.removeClass('is-invalid');

        if(codigo_telefono.val() == '')
            codigo_telefono.addClass('is-invalid');
        else
            codigo_telefono.removeClass('is-invalid');

        if(signo.val() == '')
            signo.addClass('is-invalid');
        else
            signo.removeClass('is-invalid');

        if(moneda.val() == '')
            moneda.addClass('is-invalid');
        else
            moneda.removeClass('is-invalid');

        if(descripcion.val().trim() != '' && prefijo.val().trim() != '' && codigo_telefono.val().trim() != '' && signo.val().trim() != '' && moneda.val().trim() != '')
        {
            $.ajax({
                url         :  "{{ route('admin.store_country') }}",
                method      : 'POST',
                data        : form,
                beforeSend  : function(){
                    $('.btn-store').prop('disabled', true);
                    $('.text-store').addClass('d-none');
                    $('.text-storing').removeClass('d-none');
                },
                success     : function(r)
                {
                    if(!r.status)
                    {
                        $('.btn-store').prop('disabled', false);
                        $('.text-store').removeClass('d-none');
                        $('.text-storing').addClass('d-none');
                        toast_msg(r.msg, r.type);
                        return;
                    }

                    $('#modalEditCountry').modal('hide');
                    $('.btn-store').prop('disabled', false);
                    $('.text-store').removeClass('d-none');
                    $('.text-storing').addClass('d-none');
                    toast_msg(r.msg, r.type);
                    reload_table();
                },
                dataType    : 'json'
            });
            return;
        }
    });

    $('body').on('click', '.btn-confirm', function()
    {
        event.preventDefault();
        let id      = $(this).data('id');
        Swal.fire({
            title: 'Eliminar',
            text: "¿Desea eliminar el registro?",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Si, eliminar',
            cancelButtonText: 'Cancelar',
            customClass: {
                confirmButton: 'btn btn-primary',
                cancelButton: 'btn btn-outline-danger ml-1'
            },
            buttonsStyling: false
        }).then(function (result) {
            if (result.value) 
            {
                $.ajax({
                    url         : "{{ route('admin.delete_country') }}",
                    method      : 'POST',
                    data        : {
                        '_token': "{{ csrf_token() }}",
                        id      : id
                    },
                    success     : function(r){
                        if(!r.status)
                        {
                            toast_msg(r.msg, r.type);
                            return;
                        }

                        toast_msg(r.msg, r.type);
                        reload_table();
                    },
                    dataType    : 'json'
                });
            }
        });
    });
</script>