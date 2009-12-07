package net.sourceforge.fenixedu.domain.serviceRequests;

import net.sourceforge.fenixedu.dataTransferObject.serviceRequests.RegistrationAcademicServiceRequestCreateBean;
import net.sourceforge.fenixedu.domain.Degree;
import net.sourceforge.fenixedu.domain.Employee;
import net.sourceforge.fenixedu.domain.ExecutionYear;
import net.sourceforge.fenixedu.domain.Person;
import net.sourceforge.fenixedu.domain.StudentCurricularPlan;
import net.sourceforge.fenixedu.domain.administrativeOffice.AdministrativeOffice;
import net.sourceforge.fenixedu.domain.degree.DegreeType;
import net.sourceforge.fenixedu.domain.exceptions.DomainException;
import net.sourceforge.fenixedu.domain.space.Campus;
import net.sourceforge.fenixedu.domain.student.Registration;
import net.sourceforge.fenixedu.domain.student.Student;
import net.sourceforge.fenixedu.injectionCode.AccessControl;

abstract public class RegistrationAcademicServiceRequest extends RegistrationAcademicServiceRequest_Base {

    protected RegistrationAcademicServiceRequest() {
	super();
    }

    public void init(final RegistrationAcademicServiceRequestCreateBean bean) {
	checkParameters(bean);
	super.setRegistration(bean.getRegistration());
	super.init(bean);
    }

    private void checkParameters(final RegistrationAcademicServiceRequestCreateBean bean) {
	if (bean.getRegistration() == null) {
	    throw new DomainException("error.serviceRequests.AcademicServiceRequest.registration.cannot.be.null");
	} else if (!isAvailableForTransitedRegistrations() && bean.getRegistration().isTransited()) {
	    throw new DomainException("RegistrationAcademicServiceRequest.registration.cannot.be.transited");
	} else if (ExecutionYear.readByDateTime(bean.getRequestDate()).isBefore(bean.getRegistration().getStartExecutionYear())) {
	    throw new DomainException("error.RegistrationAcademicServiceRequest.requestDate.before.registrationStartDate");
	} else if (bean.getExecutionYear() != null
		&& bean.getExecutionYear().isBefore(bean.getRegistration().getStartExecutionYear())) {
	    throw new DomainException("error.RegistrationAcademicServiceRequest.executionYear.before.registrationStartDate");
	}
    }

    @Override
    protected AdministrativeOffice findAdministrativeOffice() {
	AdministrativeOffice administrativeOffice = super.findAdministrativeOffice();
	if (administrativeOffice == null) {
	    administrativeOffice = AdministrativeOffice.getResponsibleAdministrativeOffice(getRegistration().getDegree());
	}
	return administrativeOffice;
    }

    @Override
    public void setRegistration(Registration registration) {
	throw new DomainException("error.serviceRequests.RegistrationAcademicServiceRequest.cannot.modify.registration");
    }

    public StudentCurricularPlan getStudentCurricularPlan() {
	final ExecutionYear executionYear = hasExecutionYear() ? getExecutionYear() : ExecutionYear
		.readByDateTime(getRequestDate());
	return getRegistration().getStudentCurricularPlan(executionYear);
    }

    public Degree getDegree() {
	return getStudentCurricularPlan().getDegree();
    }

    public DegreeType getDegreeType() {
	return getDegree().getDegreeType();
    }

    public boolean isBolonha() {
	return getDegree().isBolonhaDegree();
    }

    public Campus getCampus() {
	final StudentCurricularPlan studentCurricularPlan = getStudentCurricularPlan();
	return studentCurricularPlan != null ? studentCurricularPlan.getCurrentCampus() : null;
    }

    @Override
    public boolean isAvailableForEmployeeToActUpon() {
	final Person loggedPerson = AccessControl.getPerson();
	if (loggedPerson.hasEmployee()) {
	    final Employee employee = loggedPerson.getEmployee();
	    return employee.getAdministrativeOffice() == getAdministrativeOffice() && employee.getCurrentCampus() == getCampus();
	} else {
	    throw new DomainException("RegistrationAcademicServiceRequest.non.employee.person.attempt.to.change.request");
	}
    }

    @Override
    public boolean isRequestForRegistration() {
	return true;
    }

    @Override
    protected void disconnect() {
	super.setRegistration(null);
	super.disconnect();
    }

    @Override
    public Person getPerson() {
	return getRegistration().getPerson();
    }

    public Student getStudent() {
	return getRegistration().getStudent();
    }

    abstract public boolean isAvailableForTransitedRegistrations();

}
