package SpringPrac.jdbc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import SpringPrac.jdbc.dao.EmpDAO;
import SpringPrac.jdbc.model.Employee;

@Controller
public class EmpCRUDController {

	EmpDAO edao;

	@Autowired
	public EmpCRUDController(EmpDAO empdao) {
		edao = empdao;
	}

	/**
	 * selects the Add New Employee view to render by returning its name.
	 */
	@RequestMapping(value = "/emplist", method = RequestMethod.GET)
	public String getAllEmployees(Model model) {
		System.out.println("Employees List JSP Requested");

		// get all employees from DAO
		List<SpringPrac.jdbc.model.Employee> empList = edao.getAllEmployees();

		// set it to the model
		model.addAttribute("elist", empList);

		// call the view
		return "emplist";
	}

	@RequestMapping(value = "/addnewemp", method = RequestMethod.GET)
	public String addNewEmployee(Model model) {
		System.out.println("Add New Emp JSP Requested");
		return "newemp";
	}

	@RequestMapping(value = "/savenewemp", method = RequestMethod.POST)
	public String saveNewEmployee(@Validated Employee emp, Model model) {
		System.out.println("Save New Employee Page Requested");
		// get all employees from DAO
		boolean b = edao.createEmployee(emp);

		// set it to the model
		if (b) {
			model.addAttribute("emp", emp);
		}
		return "saveempsuccess";
	}

	@RequestMapping(value = "/deleteEmp", method = RequestMethod.POST)
	public String deleteEmployee(String empno, Model model) {
		Employee e = edao.getEmployeeByNo(Integer.parseInt(empno));
		if (edao.deleteEmployee(e)) {
			model.addAttribute("status", "Success");
			model.addAttribute("empdel", e);
		} else {
			model.addAttribute("status", "Fail");
		}

		return "delEmp";
	}
}