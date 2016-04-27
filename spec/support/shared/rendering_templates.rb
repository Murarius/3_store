shared_examples 'redirect and render template' do |destination, template|
  it { is_expected.to render_template template }
end


shared_examples 'render template' do |template|
  it { is_expected.to render_template template }
end
