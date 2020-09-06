Before do
  puts 'Inicio da Execucao'
end

After do |scenario|
  if scenario.failed?
    shot_file = driver.screenshot("features/report/tela_de_erro.png")
    shot_b64 = Base64.encode64(File.open(shot_file, "rb").read)
    embed(shot_b64, "image/png", "Screenshot") # Cucumber anexa o screenshot no report
  end
end
