Fabricator(:article) do
  title { "Nice title #{rand(1000)}" }
  text { "Lorem ipsum" }
end
