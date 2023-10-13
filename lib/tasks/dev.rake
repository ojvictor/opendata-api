namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    def rand_boolean()
      [true, false].sample
    end

    puts "Cadastrando as Paginas..."
    20.times do |i|
      Page.create!(
        title: Faker::Internet.domain_name, 
        url: Faker::Internet.url 
      )
    end
    puts "Paginas cadastradas com sucesso!"

    puts "######################################"
  
    puts "Cadastrando os OpenGovPrinciples..."
    20.times do |i|
      OpenGovPrinciple.create!(
        complete: rand_boolean, 
        primary: rand_boolean, 
        accessible: rand_boolean,
        page: Page.all.sample
      )
    end
    puts "OpenGovPrinciples cadastrados com sucesso!"
    
    puts "######################################"
  
    puts "Cadastrando os DwBestPratices..."
    20.times do |i|
      DwBestPratice.create!(
        metadata: rand_boolean,
        version: rand_boolean,
        license: rand_boolean,
        page: Page.all.sample,
        open_gov_principle: OpenGovPrinciple.all.sample
      )
    end
    puts "DwBestPratices cadastrados com sucesso!"
  end
end
