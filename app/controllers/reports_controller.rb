class ReportsController < ApplicationController
  def index
    @services = open_flash_chart_object(900,400,"/reports/show?&graph=services")
  end

  def show
    if params[:graph] == 'services'
      if params[:from] and !params[:from].blank?
        conditions = "date(created_at) between '#{params[:from]}'"
      else
        conditions = "date(created_at) between '#{Time.now.at_beginning_of_month.to_date.to_s}'"
      end
      if params[:to] and !params[:to].blank?
        conditions += " and '#{params[:to]}'"
      else
        conditions += " and '#{Time.now.to_date.to_s}'"
      end
      title = Title.new("Expedientes Por Día")
      @services = Service.count(:group => 'date(created_at)', :conditions => [conditions])
      values = []
      if params[:from] and !params[:from].blank?
        if params[:to] and !params[:to].blank?
          dates = (((params[:from].to_date.to_s)..(params[:to].to_date.to_s)).to_a)
        else
          dates = (((params[:from].to_date.to_s)..(Time.now.to_date.to_s)).to_a)
        end
      else
        if params[:to] and !params[:to].blank?
          dates = (((Time.now.to_date.at_beginning_of_month.to_s)..(params[:to].to_date.to_s)).to_a)
        else
          dates = (((Time.now.to_date.at_beginning_of_month.to_s)..(Time.now.to_date.to_s)).to_a)
        end
      end
      dates.each do |date|
        flag = false
        @services.each do |count|
          if date == count[0]
            values << count[1]
            flag = true
          end
        end
        if !flag
            values << 0
          end
      end
      
      line = Line.new()
      line.width = 1
      line.text = "Expedientes"
      line.colour = '#4422ff'
      line.dot_size = 5
      line.values = values
      line.set_tooltip("Fecha: #x_label#<br>#val# Expediente(s)")
      tmp = []
      x_labels = XAxisLabels.new
      x_labels.set_vertical()
      
      for date in dates
        tmp << XAxisLabel.new(date, '#0000ff', 6, 'diagonal')
      end
      
      x_labels.labels = tmp
      x = XAxis.new
      x.set_labels(x_labels)
      #y = YAxis.new
      #y.set_range(0,20,5)
      x_legend = XLegend.new("Fecha de Creación del Expediente")
      x_legend.set_style('{font-size: 10px; color: #778877}')

      #y_legend = YLegend.new("MY Y Legend")
      #y_legend.set_style('{font-size: 20px; color: #770077}')
      
      chart =OpenFlashChart.new
      chart.set_title(title)
      chart.set_x_legend(x_legend)
      #chart.set_y_legend(y_legend)
      chart.x_axis = x # Added this line since the previous tutorial
      #chart.y_axis = y
      chart.add_element(line)

      render :text => chart.to_s
    end
  end
end
