#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require jquery.pjax
#= require_tree ../../../vendor/assets/javascripts/markdown/
#= require_tree .
$(document).ready ->
  InitMarkdown()

$(document).on("pjax:end", () ->
  InitMarkdown()
)

jQuery ->
  $('a:not([data-method=delete]):not([data-remote]):not([data-behavior]):not([data-skip-pjax])').pjax('[data-pjax-container]')

InitMarkdown = () ->
  converter1 = Markdown.getSanitizingConverter()
  editor1 = new Markdown.Editor(converter1)
  editor1.run()
