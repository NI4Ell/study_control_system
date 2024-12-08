require 'json'

def readJson
  f = File.open('semester_data.json', 'r')
  data = JSON.parse(f.read)
  f.close

  data
end

data = readJson

def finish_lab(data, disciplin, lab)
  f = File.open('semester_data.json', 'w')
  data['disciplines'][disciplin].each do |lab_work|
    if lab_work['lab_work_number'] == lab
      lab_work['status'] = 'complete'
      break
    end
  end
  f.write(JSON.pretty_generate(data))
  f.close
end

def deadline_lab(data)
  data['disciplines'].each do |discipline, labs|
    labs.each do |lab|
      puts "Дедлайн для лабораторной работы № #{lab['lab_work_number']} для #{discipline} #{lab['deadline']}"
    end
  end
end

def show_status_labs(data)
  data['disciplines'].each do |discipline, labs|
    count_с = 0
    count_i = 0
    labs.each do |lab|
      if lab['status'] == 'complete'
        puts "Лабораторная № #{lab['lab_work_number']} по #{discipline} выполнена"
      else
        puts "Лабораторная № #{lab['lab_work_number']} по #{discipline} не выполнена"
      end
      if lab['status'] == 'complete'
        count_с += 1
      else
        count_i += 1
      end
    end
    puts "По #{discipline} выполнено #{count_с} лабораторных"
    puts "По #{discipline} не выполнено #{count_i} лабораторных"
  end
end

def show_semester_info(data)
  puts "Семестр начинается: #{data['semester_start']}"
  puts "Семестр заканчивается: #{data['semester_end']}"
end



if ARGV.empty?
  puts 'No arguments provided.'
  exit
end
case ARGV[0]
when 'finish_lab'
  puts 'Введите предмет'
  discipline = $stdin.gets.chomp
  puts 'Введите номер лабораторной работы'
  lab = $stdin.gets.chomp.to_i
  finish_lab(data, discipline, lab)
when 'show_deadlines'
  deadline_lab(data)
when 'show_status_labs'
  show_status_labs(data)
when 'semester_info'
  show_semester_info(data)
else
  puts "Unknown command: #{ARGV[0]}"
end
