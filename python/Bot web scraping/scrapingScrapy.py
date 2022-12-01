from scrapy.item import Field
from scrapy.item import Item
from scrapy.spiders import Spider
from scrapy.selector import Selector
from scrapy.loader import ItemLoader

class Zapatilla(Item):
    nombre = Field()
    precio = Field()

class DigitalSportSpider(Spider):
    name = "Nike Dunk low"
    start_urls = ['https://www.digitalsport.com.ar/search/?search=nike%20dunk%20low']
    def parse(self, response):
        sel = Selector(response)
        Zapatillas = sel.xpath('//div[class="products_wraper"]/a')
       
        #Iterar sobre todas las preguntas
        for i,elem in enumerate(Zapatillas):
            item = ItemLoader(Zapatillas(), elem)
            item.add_xpath('nombre', './/h3/text()')
            item.add_value('precio', './/div[class="precio"]/tect()')

            yield item.load_item()