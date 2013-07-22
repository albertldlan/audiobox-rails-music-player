

jQuery ->
  $('#fileupload').fileupload
    add: (e, data) ->
      types = /(\.|\/)(mp3|m4a)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#fileupload').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a mp3, wav, or m4a audio file")
    
    progress: (e, data) ->
      if data.context
        progress = parseInt(data.loaded / data.total * 100, 10)
        data.context.find('.bar').css('width', progress + '%')
    
    done: (e, data) ->
      file = data.files[0]
      domain = $('#fileupload').attr('action')
      path = $('#fileupload input[name=key]').val().replace('${filename}', file.name)
      to = $('#fileupload').data('post')
      content = {}
      content[$('#fileupload').data('as')] = domain + path
      $.post(to, content)
      data.context.remove() if data.context # remove progress bar
    
    fail: (e, data) ->
      alert("#{data.files[0].name} failed to upload.")
      console.log("Upload failed:")
      console.log(data)