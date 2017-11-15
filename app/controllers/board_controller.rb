class BoardController < ApplicationController

  def index
      result = ActiveRecord::Base.connection.exec_query(
          'SELECT u.firstname, u.lastname, u.email, u.phone, u.address,
          c.companyname, ca.catname, ut.usertypename FROM superduser u
inner join company c on c.companyid = u.companyid
inner join category ca on ca.catid = u.categoryid
inner join usertype ut on ut.usertypeid = u.usertypeid
Order by u.firstname ASC 
')
    @users = Kaminari.paginate_array(result.to_hash).page(params[:page]).per(10)
      @@users = @users
    @category = ActiveRecord::Base.connection.exec_query('Select catname,catid from category').to_hash
    @company = ActiveRecord::Base.connection.exec_query('Select companyname,companyid from company').to_hash
    @usertype = ActiveRecord::Base.connection.exec_query('Select usertypename, usertypeid from usertype').to_hash
  end
  
  def sendEmail
    UserMailer.semail(@@users,params[:embody]).deliver_later
    result = ActiveRecord::Base.connection.exec_query(
        'SELECT u.firstname, u.lastname, u.email, u.phone, u.address,
          c.companyname, ca.catname, ut.usertypename FROM superduser u
inner join company c on c.companyid = u.companyid
inner join category ca on ca.catid = u.categoryid
inner join userType ut on ut.usertypeid = u.usertypeid
where ut.usertypeid =' +@@utype + ' and ca.catid='+ @@cat + ' and c.companyid =' + @@comp + ' Order by u.firstname ASC ')
    @users =Kaminari.paginate_array( result.order(:firstname).to_hash).page(params[:page]).per(10)
    @@users = @users
    @category = ActiveRecord::Base.connection.exec_query('Select catname,catid from category').to_hash
    @company = ActiveRecord::Base.connection.exec_query('Select companyname,companyid from company').to_hash
    @usertype = ActiveRecord::Base.connection.exec_query('Select usertypename, usertypeid from usertype').to_hash
    render :index
  end

  def filter
    @@cat = params["catid"]
    @@comp= params["companyid"]
    @@utype= params["usertypeid"]
    result = ActiveRecord::Base.connection.exec_query(
        'SELECT u.firstname, u.lastname, u.email, u.phone, u.address,
          c.companyname, ca.catname, ut.usertypename FROM superduser u
inner join company c on c.companyid = u.companyid
inner join category ca on ca.catid = u.categoryid
inner join usertype ut on ut.usertypeid = u.usertypeid
where ut.usertypeid =' +params["usertypeid"] + ' and ca.catid='+ params["catid"] + ' and c.companyid =' + params["companyid"] + ' Order by u.firstname ASC ')
    @users = Kaminari.paginate_array(result.to_hash).page(params[:page]).per(10)
    @@users = @users
    @category = ActiveRecord::Base.connection.exec_query('Select catname,catid from category').to_hash
    @company = ActiveRecord::Base.connection.exec_query('Select companyname,companyid from company').to_hash
    @usertype = ActiveRecord::Base.connection.exec_query('Select usertypename, usertypeid from usertype').to_hash
    render :index
  end

end
