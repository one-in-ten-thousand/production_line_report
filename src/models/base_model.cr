abstract class BaseModel < Avram::Model
  def self.database
    AppDatabase
  end

  def create_date
    created_at.to_s("%Y年%m月%d日")
  end
end
