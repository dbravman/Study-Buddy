module ApplicationHelper
  def current_teacher
    @current_teacher ||= Teacher.find(session[:teacher_id])
  end

  def logged_in?
    session[:teacher_id] != nil
  end

  def check_logged_in
    redirect_to root_path unless logged_in?
  end

  def check_admin
    redirect_to teacher_path(current_teacher) unless current_teacher.admin
  end
end
