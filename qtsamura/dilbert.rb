=begin
** dilbert.rb
** 27/SEP/2007
** ETD-Software
**  - Daniel Martin Gomez <etd[-at-]nomejortu.com>
**
** Desc:
**   Qt example application to show how to display a window with an image on it.
** A Qt::Label widget is used for this purpose. The image is gathered from the 
** Internet.
**
** Version:
**  v1.0 [27/September/2007]: first released
**
**
** License:
**   This program is free software: you can redistribute it and/or modify
** it under the terms of the GNU General Public License as published by
** the Free Software Foundation, either version 3 of the License, or
** (at your option) any later version.
**
** This program is distributed in the hope that it will be useful,
** but WITHOUT ANY WARRANTY; without even the implied warranty of
** MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
** GNU General Public License for more details.
**
** You should have received a copy of the GNU General Public License
** along with this program.  If not, see <http://www.gnu.org/licenses/>.
**
=end

require 'Qt4'
require 'open-uri'
#---------------------------- config
site = 'http://www.dilbert.com/'
regexp = /<img\ssrc=\"(\/comics\/dilbert\/archive\/images\/\w*.gif)\"\salt=\"Today's\sComic\"\sBORDER.*>/i
#---------------------------- /config

#---------------------------- main
src = open(site).read
img = src.scan(regexp)[0][0]
comic = site+img
filename = '/tmp/'+File.basename(comic)
`wget -O #{filename} #{comic} 2>/dev/null` unless (File.exist?(filename))

app = Qt::Application.new(ARGV)
label = Qt::Label.new
image = Qt::Image.new(filename)
label.pixmap = Qt::Pixmap.fromImage(image)
label.show
app.exec
