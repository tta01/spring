package spring.practice.home.admin.service.serviceImpl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.tiles.Attribute;
import org.apache.tiles.AttributeContext;
import org.apache.tiles.preparer.PreparerException;
import org.apache.tiles.preparer.ViewPreparer;
import org.apache.tiles.request.Request;

import spring.practice.home.admin.service.MngrMenuService;
import spring.practice.home.admin.vo.MngrMenuVO;

public class MenuPreparer implements ViewPreparer {

    @Resource
    private MngrMenuService menuService; 

    @Override
    public void execute(Request tilesContext, AttributeContext attributeContext) throws PreparerException {
        MngrMenuVO menuVO = new MngrMenuVO();
        
        List<MngrMenuVO> menuList = menuService.selectMenu(menuVO);
        System.out.println("Menu List Size: " + (menuList != null ? menuList.size() : 0));

        // 메뉴 리스트를 타일즈 컨텍스트에 저장
        // "menuList" 이름으로 데이터를 전달하며, true를 설정하여 JSP에서 사용할 수 있도록 함.
        attributeContext.putAttribute("menuList", new Attribute(menuList), true);
    }
}
