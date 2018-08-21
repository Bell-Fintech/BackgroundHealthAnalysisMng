package HealthAnalysisMng.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import HealthAnalysisMng.hbm.base.AnalysisResult;
import HealthAnalysisMng.model.DataGrid;
import HealthAnalysisMng.model.DataGridJson;
import HealthAnalysisMng.service.background.AnalysisResultServiceI;

/**
 * @ClassName: DisplayMessageController
 * @Description: DisplayMessage控制器
 * @author DingMingliang
 * @date 2014年10月21日 下午2:00:29
 */
@Controller
@RequestMapping("/admin/analysisResultController")
public class AnalysisResultController extends BaseController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger
			.getLogger(AnalysisResultController.class);

	private AnalysisResultServiceI analysisResultService;

	/**
	 * analysisResultService
	 *
	 * @return the analysisResultService
	 * @since CodingExample Ver 1.0
	 */

	public AnalysisResultServiceI getAnalysisResultService() {
		return analysisResultService;
	}

	/**
	 * analysisResultService
	 *
	 * @param analysisResultService
	 *            the analysisResultService to set
	 * @since CodingExample Ver 1.0
	 */
	@Autowired
	public void setAnalysisResultService(
			AnalysisResultServiceI analysisResultService) {
		this.analysisResultService = analysisResultService;
	}

	@RequestMapping(params = "index")
	public String index() {
		return "admin/analysisResult/index";
	}

	@RequestMapping(params = "datagrid")
	@ResponseBody
	public DataGridJson datagrid(DataGrid dg, AnalysisResult analysisResult) {
		return analysisResultService.datagrid(dg, analysisResult);
	}

}
