package vn.com.ibss.au.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import vn.com.ibss.au.dto.RoleDTO;
import vn.com.ibss.au.service.RoleService;
import vn.ibss.common.base.BaseController;


@RestController
@RequestMapping(value = "/roles")
@Api(value = "roles")
@PreAuthorize("hasAuthority('WRITE')")
public class RoleController extends BaseController {

    @Autowired
    private RoleService roleService;

    @ApiOperation(
            httpMethod = "GET",
            value = "GET role by ID",
            notes = "GET role by ID",
            response = RoleDTO.class
    )
    @GetMapping("/{id}")
    // Table permission
    //@PreAuthorize("hasScope('READ')") // Table permission
    //@PreAuthorize("hasAuthority('WRITE')")
    public ResponseEntity<RoleDTO> getRole(@PathVariable Integer id) {
        return null;
    }

}
