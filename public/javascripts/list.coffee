S = KISSY
$ = S.Node.all
$search = $ '#J_Search'
$list = $ '#J_List'
$listItem = $list.all 'li'

$search.on 'keyup',(ev)->
  letter = $(ev.target).val()
  if letter is ''
    $listItem.show()
    return true;

  $listItem.hide()
  $listItem.each(($item)->
    name = $item.attr 'data-name'
    desc = $item.attr 'data-desc'
    author = $item.attr 'data-author'
    data = [$item.attr 'data-name',$item.attr 'data-desc',$item.attr 'data-author']
    reg = new RegExp(letter)
    S.each(data,(d)->
      if reg.test d
        $item.show()
        return true
    )
  )

document.domain="kissyui.com"
parent = window.parent
height = document.getElementById('J_List').scrollHeight+200;
iframe = parent.document.getElementsByTagName('iframe')[0];
iframe.height = height