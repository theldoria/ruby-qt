require 'Qt4'

class MyWidget < Qt::Widget
  def initialize(parent = nil)
     super()
     # quit = Qt::PushButton.new('Quit')
     # quit.setFont(Qt::Font.new('Times', 18, Qt::Font::Bold))

     # lcd = Qt::LCDNumber.new(2)

     # slider = Qt::Slider.new(Qt::Horizontal)
     # slider.setRange(0, 99)
     # slider.setValue(0)

     # connect(quit, SIGNAL('clicked()'), $qApp, SLOT('quit()'))
     # connect(slider, SIGNAL('valueChanged(int)'), lcd, SLOT('display(int)'))

     # layout = Qt::VBoxLayout.new(self)
     # layout.addWidget(quit)
     # layout.addWidget(lcd)
     # layout.addWidget(slider)
     # setLayout(layout)

     setWindowTitle(__FILE__)
     setToolTip("This is MyWidget")

     init_folder_ui
  end

  def center
     qdw = Qt::DesktopWidget.new

     screenWidth = qdw.width
     screenHeight = qdw.height

     x = (screenWidth - width()) / 2
     y = (screenHeight - height()) / 2

     move x, y
  end

  def init_folder_ui
     grid = Qt::GridLayout.new self

     nameLabel = Qt::Label.new "Name", self
     nameEdit = Qt::LineEdit.new self
     text = Qt::TextEdit.new self
     okButton = Qt::PushButton.new "OK", self
     closeButton = Qt::PushButton.new "Close", self

     grid.addWidget nameLabel, 0, 0
     grid.addWidget nameEdit, 0, 1, 1, 3
     grid.addWidget text, 1, 0, 2, 4
     grid.setColumnStretch 1, 1
     grid.addWidget okButton, 4, 2
     grid.addWidget closeButton, 4, 3
  end

  def init_v_h_ui
     windLabel = Qt::Label.new "Windows", self
     edit = Qt::TextEdit.new self
     edit.setEnabled false

     activate = Qt::PushButton.new "Activate", self
     close = Qt::PushButton.new "Close", self
     help = Qt::PushButton.new "Help", self
     ok = Qt::PushButton.new "OK", self

     vbox = Qt::VBoxLayout.new self do
        addWidget windLabel

        hbox1 = Qt::HBoxLayout.new do
           addWidget edit
           vbox1 = Qt::VBoxLayout.new do
              addWidget activate
              addWidget close, 0, Qt::AlignTop
           end
           addLayout vbox1
        end
        addLayout hbox1

        hbox2 = Qt::HBoxLayout.new do
           addWidget help
           addStretch 1
           addWidget ok
        end
        addLayout hbox2, 1
     end
     setLayout vbox
  end
end

app = Qt::Application.new(ARGV)

widget = MyWidget.new()
widget.show()
widget.center()

app.exec()
