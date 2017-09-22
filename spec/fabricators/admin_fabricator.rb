Fabricator(:admin) do
  login { sequence { |i| "admin#{i}" } }
  password "hard-to-guess"
end