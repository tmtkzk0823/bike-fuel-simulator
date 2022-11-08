require 'nokogiri'
require 'open-uri'
require 'kconv'
require 'csv'
require 'dotenv/load'


  url = "#{ENV['REFERENCE_SOURCE_BIKE_DATA_URL']}/HONDA/"
  res = URI.open(url)

  honda_page =  Nokogiri::HTML.parse(res)
  active_bike_lists = honda_page.css('li.active')
  active_bike_lists_url = active_bike_lists.css('dt.name a')
  # classがactiveになっているバイクの詳細へのURLの配列
  ACTIVE_BIKE_URLS = active_bike_lists_url.map{ |url| url.attribute('href')}  #{'ENV[REFERENCE_SOURCE_BIKE_DATA_URL']}/14707/ のような形 （後で消すメモ）


  # 上記の配列から各バイクのサービスページURLの配列を作る
  bike_service_data_urls = ACTIVE_BIKE_URLS.map { |active_url|
  response = URI.open(active_url)
  page = Nokogiri::HTML.parse(response)
  page.css('.clearfix.biketype_tab li.m02 a').attribute('href')
  }

  ACTIVE_BIKE_SERVICE_DATA_URLS = bike_service_data_urls.compact


  ACTIVE_BIKE_SERVICE_DATA_URLS.each do |servicedata_url|   #各バイクのサービスデータのURLを繰り返し処理する（後で消すメモ）  
  servicedata_html = URI.open(servicedata_url).read.toutf8
  # バイクDBに登録する値を取ってくる
  detail_list =  Nokogiri::HTML.parse(servicedata_html)
  bike_data_list = []
  bike_name = detail_list.css('div.mh_name h2').children[0].text.slice(4..-1)
  displacement = 'データなし'
  cruising_distance = 'データなし'
  bike_category = 'データなし'
  bike_image = ''
    detail_list.css('div.section.servicedata table th').each do |th|
      case th.text.strip 
        when 'モデル名' then
          bike_name = th.next_element.text 
        when '排気量' then
          displacement = th.next_element.text 
        when '航続可能距離' then
          cruising_distance = th.next_element.text   
      end
    end

  if detail_list.css('ul.bxslider01 img').empty?
    bike_image = '画像なし'
  else
    bike_image = detail_list.css('ul.bxslider01 img')[0].attribute('src').value
  end

  bike_category = detail_list.css('p.category_icons span').attribute('class').value

    puts bike_data = [name: bike_name, displacement: displacement, cruising_distance: cruising_distance, bike_image: bike_image, bike_category: bike_category]
    bike_data_list << bike_data
    sleep rand(1..2)
  end