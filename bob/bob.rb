class Bob
  RESPONSES = {
    question: "Sure.",
    silent:  "Fine. Be that way!",
    yelling_question: "Calm down, I know what I'm doing!",
    yelling: "Whoa, chill out!",
    whatever: "Whatever."
  }.freeze

  def self.hey(remark)
    remark = remark.strip

    return RESPONSES[:silent] if silent?(remark)
    return RESPONSES[:yelling_question]  if yelled_question?(remark)
    return RESPONSES[:question]if question?(remark)
    return RESPONSES[:yelling] if yelling?(remark)

    RESPONSES[:whatever]
  end

  private
  def self.silent?(remark)
    remark.empty?
  end

  def self.yelled_question?(remark)
    yelling?(remark) && question?(remark)
  end

  def self.question?(remark)
    remark.end_with?("?")
  end

  def self.yelling?(remark)
    remark.match(/[a-zA-Z]/) && remark.upcase == remark
  end
end
