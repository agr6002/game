class Model
  def initialize(app)
    #puts "  initializing model"
    @app = app
  end

  def run(info)
    function = info[0]
    file = "test1.csv" #info[1]
    row = info[1]

    @catagory = info[2]
    case @catagory
    when "name"
      column = "1"
    when "color"
      column = "2"
    when "level"
      column = "3"
    when "speed"
      column = "4"
    when "size"
      column = "5"
    when "kills"
      column = "6"
    else
      if not (function == "help") or (function == "deleteColumn")
        return "incorect"
      end
    end

    fill = info[3]
    case function
    when "getData"
      return getData(file, row, column)
    when "changeData"
      return changeData(file, row, column, fill)
    when "delete"
      return delete(file, row, column)
    when "deleteRow"
      return deleteRow(file, row)
    when "deleteColumn"
      return deleteColumn(file, column)
    when "help"
      return "help"
    else
      return "incorect"
    end
  end

  def array(fileName)
    if not File::exist?(fileName) 
      file = File.new(fileName, "a")
      file.close
      return 'newFile_noData'
    end
    file = File.open(fileName, "r")
    # if file:empty?
    #   return 'newFile_noData'
    # end
    arrayFile = []
    while line = file.gets
      lineArray = []
      split = line.split("  ")
      for i in 0..split.length
        s = split[i]
        case s
        when "\n", " ", ","

        else
          if not s == "0" and s.to_i == 0
              if not s == ""
                lineArray.push(s)
              end
          else
            lineArray.push(s.to_i)
          end
        end
      end
      lineArray.pop
      arrayFile.push(lineArray)
    end
    file.close
    return arrayFile
  end

  def grid(array)
    grid = ""
    array.each do |a|
      b = -1
      a.each do |aEach|
        b += 1
        grid += "  "
        grid += aEach.to_s
        if not (a.length - 1)== b
          grid += "  ,"
        end
      end
      grid += "\n"
    end
    return grid
  end

  def getData(file, row, column)
    lines = array(file)
    if lines == "noData"
      return "There is no data in file"
    end
    return "The " + @catagory + " is " + lines[row.to_i][column.to_i].to_s
  end

  def changeData(file, row, column, data)
    lines = array(file)
    if lines == "newFile_noData"
      return "There is no data in file"
    end
    lines[row.to_i][column.to_i] = data.to_i
    grid(lines)
    File.write(file, grid(lines))
    return 'data changed'
  end

  def delete(file, row, column)
    lines = array(file)
    lines[row.to_i][column.to_i] = "nil"
    File.write(file, grid(lines))
    return "space deleted"
  end

  def deleteRow(file, row)
    lines = array(file)
    lines.delete_at(row.to_i)
    File.write(file, grid(lines))
    return "row deleted"
  end

  def deleteColumn(file, column)
    lines = array(file)
    lines.each do |l|
      l.delete_at(column.to_i)
    end
    File.write(file, grid(lines))
    return "column deleted"
  end
end

=begin
  def deleteColumn(file, column)
    lines = array(file)
    for i in 0..lines.length
      lines[i].delete_at(column.to_i)
     end    
    File.write(file, grid(lines))
  end
=end
