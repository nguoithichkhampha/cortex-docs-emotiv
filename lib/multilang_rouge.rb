require 'kramdown'

Kramdown::Converter::Html.class_eval do
  def convert_codeblock(el, indent)
    attr = el.attr.dup
    full_lang_name = extract_code_language!(attr)
    if full_lang_name
      parts = full_lang_name.split('--')
      rouge_lang_name = (parts) ? parts[0] : "" # just parts[0] here causes null ref exception when no language specified
      result = Middleman::Syntax::Highlighter.highlight(el.value, rouge_lang_name)
      result.sub("highlight #{rouge_lang_name}") do |match|
        match + " tab-" + full_lang_name
      end
    else
      Middleman::Syntax::Highlighter.highlight(el.value, full_lang_name)
    end
  end
end
