package com.rdsic.nuce.service_impl;

import com.rdsic.nuce.custom_reponsitory.CustomCourseResponsitory;
import com.rdsic.nuce.custom_reponsitory.CustomStudentRespository;
import com.rdsic.nuce.entity.company.AddressCompany;
import com.rdsic.nuce.entity.course.Course;
import com.rdsic.nuce.entity.course.CourseHasStudent;
import com.rdsic.nuce.entity.students.GroupStudent;
import com.rdsic.nuce.entity.students.Students;
import com.rdsic.nuce.entity.user.User;
import com.rdsic.nuce.key.CourseStudentKey;
import com.rdsic.nuce.responsitory.CourseHasStudentRepository;
import com.rdsic.nuce.responsitory.CourseRepository;
import com.rdsic.nuce.responsitory.StudentsRepository;
import com.rdsic.nuce.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import java.util.logging.Level;
import java.util.logging.Logger;

@Service
public class StudentService_Impl implements StudentService {
    private static final Logger LOGGER = Logger.getLogger(StudentService_Impl.class.getName());
    @Autowired
    private StudentsRepository studentsRepository;

    @Autowired
    private CustomStudentRespository customStudentRespository;
    @Autowired
    private CourseHasStudentRepository courseHasStudentRepository;
    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    private CustomCourseResponsitory customCourseResponsitory;

    @Override
    public Students findById(int id) {
        try {
            return studentsRepository.findByIdAndDeletedTrue(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-id-error: {0}", e.getMessage());
            return null;
        }

    }

    @Override
    public List<Students> findAll() {
        try {
            List<Students> studentsList = studentsRepository.findByDeletedTrue();
            studentsList.sort((o1, o2) -> {
                return o2.getId() - o1.getId();
            });
            return studentsList;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-all-error: {0}", e.getMessage());
            return null;
        }
    }


    @Override
    public List<Students> findByCodeGtAndDeletedTrueGetAllProperties(String codeGt) {
        try {
            List<Students> studentsList = studentsRepository.findByCodeGtAndDeletedTrue(codeGt);
            studentsList.sort((o1, o2) -> {
                return o2.getId() - o1.getId();
            });
            return studentsList;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-all-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Students> findByFullNameLikeAndDeletedTrue(String name) {
        try {
            List<Students> studentsList = studentsRepository.findByFullNameLikeAndDeletedTrue("%" + name + "%");
            studentsList.sort((o1, o2) -> {
                return o2.getId() - o1.getId();
            });
            return studentsList;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-all-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Students> findByPhoneNumberAndDeletedTrue(String phone) {
        try {
            List<Students> studentsList = studentsRepository.findByPhoneNumberAndDeletedTrue(phone);
            studentsList.sort((o1, o2) -> {
                return o2.getId() - o1.getId();
            });
            return studentsList;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-all-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public Students findByCodePrivateAndDeletedTrue(String codePrivate) {
        try {
            return studentsRepository.findByCodePrivateAndDeletedTrue(codePrivate);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-id-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Students> findByCourseIdNumAndDeletedTrue(int courseId) {
        try {
            return studentsRepository.findByCourseIdNumAndDeletedTrue(courseId);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-id-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Students> findByGroupStudentIdNumAndDeletedTrue(int idGroupStudent) {
        try {
            return studentsRepository.findByGroupStudentIdNumAndDeletedTrue(idGroupStudent);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-id-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Students> findByGroupStudentIdNumAndCourseIdNumAndDeletedTrue(int idGroupStudent, int idCourse) {
        try {
            return studentsRepository.findByGroupStudentIdNumAndCourseIdNumAndDeletedTrue(idGroupStudent, idCourse);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-id-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Students> findBySigninDateLikeAndDeletedTrue(LocalDate date) {
        try {
            return studentsRepository.findBySigninDateLikeAndDeletedTrue(date);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-id-error: {0}", e.getMessage());
            return null;
        }
    }

    /*Custom*/
    @Override
    public List<Students> findByIdGroupStudent_IdAndDeletedTrue_Custom(int idGroupStudent) {
        try {
            List<Students> studentsList = customStudentRespository.findByGroupStudentAndDeletedTrue_GetAllProperties(idGroupStudent);
            studentsList.sort((o1, o2) -> {
                return o2.getId() - o1.getId();
            });
            return studentsList;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-all-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public List<Students> findByCodeGtGetIdAndName_Custom(String codePrivate) {
        try {
            List<Students> studentsList = customStudentRespository.findByCodeGtGetIdAndName(codePrivate);
            studentsList.sort((o1, o2) -> {
                return o2.getId() - o1.getId();
            });
            return studentsList;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-all-error: {0}", e.getMessage());
            return null;
        }
    }

    @Override
    public Students findByIdGetAllProperties_Custom(int id) {
        try {
            return customStudentRespository.findByIdGetAllProperties(id);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-id-error: {0}", e.getMessage());
            return null;
        }
    }


    @Override
    public Students findByCodePrivateAndDeletedTrue_GetIdAndFullNameAndCodeGt_Custom(String codePrivate) {
        try {
            return customStudentRespository.findByCodePrivateAndDeletedTrue_GetIdAndFullNameAndCodeGt(codePrivate);
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "find-by-id-error: {0}", e.getMessage());
            return null;
        }
    }

    /*end Custom*/
    @Override
    public boolean saveNewStudent(Students students, Course course, AddressCompany addressCompany, GroupStudent groupStudent, User user) {
        try {
            if (students.getId() == null) {
                saveNewStudentIdNull(students, course, addressCompany, groupStudent, user);
            } else {
                updateStudentIdDiffrentNull(students, course, addressCompany, groupStudent, user);
            }
            return true;
        } catch (Exception e) {
            LOGGER.log(Level.SEVERE, "save-error: {0}", e.getMessage());
            e.printStackTrace();
            return false;
        }
    }

    public void saveNewStudentIdNull(Students students, Course course, AddressCompany addressCompany, GroupStudent groupStudent, User user) {
        // id student = null th?? v?? h??m n??y
        if (students.getCodeGt() == "") {
            // neu sinh vien khong co ma gioi thieu thi luu nhu binh thuong
            // set gi?? cho student
            students.setTuitionFeeOfStudent(course.getTuitionFeeAfterReduction());
            students.setIdUser(user);
            // set ?????i t?????ng ????o t???o
            students.setIdGroupStudent(groupStudent);
            // set dia chi cho student
            students.setAddressCompany(addressCompany);
            // l??u id course c???a student n??y l???i
            students.setCourseIdNum(course.getId());
            // l??u student vao he thong
            students = studentsRepository.save(students);
            // l??u khoa hoc ma student ????ng k??
            // vi course v?? student co qh 1-n nen se co key o bang trung gian
            CourseStudentKey courseStudentKey =
                    new CourseStudentKey(course.getId(), students.getId());
            CourseHasStudent courseHasStudent =
                    new CourseHasStudent(courseStudentKey, students, course, true);
            courseHasStudentRepository.save(courseHasStudent);
        } else {
            Students stLeader = studentsRepository.findByCodePrivateAndDeletedTrue(students.getCodeGt());
            if (course.getId() != stLeader.getCourseIdNum()) {
                students.setCodeGt("C???nh b??o: Tr?????ng nh??m kh??ng h???c c??ng l???p. Vui l??ng ki???m tra l???i");
            }
            students.setTuitionFeeOfStudent(course.getTuitionFeeAfterReduction());
            students.setIdUser(user);
            // set ?????i t?????ng ????o t???o
            students.setIdGroupStudent(groupStudent);
            // set dia chi cho student
            students.setAddressCompany(addressCompany);
            // l??u id course c???a student n??y l???i
            students.setCourseIdNum(course.getId());
            // l??u student vao he thong
            students = studentsRepository.save(students);
            // l??u khoa hoc ma student ????ng k??
            // vi course v?? student co qh 1-n nen se co key o bang trung gian
            CourseStudentKey courseStudentKey =
                    new CourseStudentKey(course.getId(), students.getId());
            CourseHasStudent courseHasStudent =
                    new CourseHasStudent(courseStudentKey, students, course, true);
            courseHasStudentRepository.save(courseHasStudent);
            if (stLeader != null) {
                updateTuitionFeeOfStudent(stLeader);
            }
        }
    }

    public void updateStudentIdDiffrentNull(Students students, Course course, AddressCompany addressCompany, GroupStudent groupStudent, User user) {
        if (students.getCodeGt() != "" && students.getCodeGt() != "C???nh b??o: Tr?????ng nh??m kh??ng h???c c??ng l???p. Vui l??ng ki???m tra l???i") {
            Students stLeader = studentsRepository.findByCodePrivateAndDeletedTrue(students.getCodeGt());
            System.out.println(stLeader);
            if (course.getId() != stLeader.getCourseIdNum()) {
                students.setCodeGt("C???nh b??o: Tr?????ng nh??m kh??ng h???c c??ng l???p. Vui l??ng ki???m tra l???i");
            }
            students.setTuitionFeeOfStudent(course.getTuitionFeeAfterReduction());
            students.setIdUser(user);
            // set ?????i t?????ng ????o t???o
            students.setIdGroupStudent(groupStudent);
            // set dia chi cho student
            students.setAddressCompany(addressCompany);
            // l??u id course c???a student n??y l???i
            students.setCourseIdNum(course.getId());
            // l??u student vao he thong
            students = studentsRepository.save(students);
            // l??u khoa hoc ma student ????ng k??
            // vi course v?? student co qh 1-n nen se co key o bang trung gian
            CourseStudentKey courseStudentKey =
                    new CourseStudentKey(course.getId(), students.getId());
            CourseHasStudent courseHasStudent =
                    new CourseHasStudent(courseStudentKey, students, course, true);
            courseHasStudentRepository.save(courseHasStudent);
            if (stLeader != null) {
                // khi c?? 1 ng?????i kh??c nh???p m?? gi???i thi???u c???a m??nh
                // l???p t???c m??nh s??? ??c chuy???n th??nh nh??m tr?????ng v?? t??nh ti???n theo nh??m tr?????ng lu??n: set code = ""
                stLeader.setCodeGt("");
                updateTuitionFeeOfStudent(stLeader);
            }
        } else {
            students.setTuitionFeeOfStudent(course.getTuitionFeeAfterReduction());
            students.setIdUser(user);
            // set ?????i t?????ng ????o t???o
            students.setIdGroupStudent(groupStudent);
            // set dia chi cho student
            students.setAddressCompany(addressCompany);
            // l??u id course c???a student n??y l???i
            students.setCourseIdNum(course.getId());
            // l??u student vao he thong
            students = studentsRepository.save(students);
            // l??u khoa hoc ma student ????ng k??
            // vi course v?? student co qh 1-n nen se co key o bang trung gian
            CourseStudentKey courseStudentKey =
                    new CourseStudentKey(course.getId(), students.getId());
            CourseHasStudent courseHasStudent =
                    new CourseHasStudent(courseStudentKey, students, course, true);
            courseHasStudentRepository.save(courseHasStudent);
        }

    }

    public void updateTuitionFeeOfStudent(Students stLeader) {
        // c???p nh???t l???i list r???i g??n l???i ti???n h???c
        List<Students> listStudent = studentsRepository.findByCourseIdNumAndCodeGtAndDeletedTrue(stLeader.getCourseIdNum(), stLeader.getCodePrivate());
        // l???y ti???n h???c c???a kh??a h???c ???? gi???m
        double feeCourse = courseRepository.findByIdAndDeletedTrue(stLeader.getCourseIdNum()).getTuitionFeeAfterReduction();
        int lengthStudent = listStudent.toArray().length;
        // bi???n 'percent' n??y ch???a s??? ph???n tr??m ??c gi???m
        int percentSt = 1;
        int percentLeader = 1;
        switch (lengthStudent) {
            //  C???ng 1 v?? t??nh c??? student hi???n t???i chu???n b??? post l??n
            // t????ng ???ng nh??m 2 3 4 5, tr??? nh??m tr?????ng th?? ch??? c?? case 1 2 3 4, t??nh c??? nh??m tr?????ng t???i ??a l?? nh??m 16 ng?????i
            // switch n??y ????? t??nh gi?? ti???n h???c cho student hi???n t???i v???a ??c post l??n h??? th???ng
            case 0:
                percentSt = 0;
                break;
            case 1:
            case 2:
            case 3:
            case 4:
                percentSt = 5;
                break;
            case 5:
            case 6:
                percentSt = 10;
                break;
            case 7:
            case 8:
            case 9:
                percentSt = 15;
                break;
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
            case 15:
                percentSt = 20;
                break;
            default:
                percentSt = 20;
                break;
        }
        // t??nh ph???n tr??m cho leader
        switch (lengthStudent) {
            // t????ng ???ng nh??m 2 3 4 5, tr??? nh??m tr?????ng th?? ch??? c?? case 1 2 3 4, t??nh c??? nh??m tr?????ng t???i ??a l?? nh??m 16 ng?????i
            // switch n??y ????? t??nh gi?? ti???n h???c cho student hi???n t???i v???a ??c post l??n h??? th???ng
            case 0:
                percentLeader = 0;
                break;
            case 1:
            case 2:
                percentLeader = 15;
                break;
            case 3:
                percentLeader = 20;
                break;
            case 4:
                percentLeader = 25;
                break;
            case 5:
            case 6:
                percentLeader = 35;
                break;
            case 7:
            case 8:
            case 9:
                percentLeader = 50;
                break;
            case 10:
            case 11:
            case 12:
            case 13:
            case 14:
                percentLeader = 70;
                break;
            case 15:
                percentLeader = 100;
                break;
            default:
                percentLeader = 100;
                break;
        }
        // c???p nh???t l???i gi?? cho t???t c??? sinh vi??n c??n l???i c??ng nh??m
        for (Students item : listStudent) {
            item.setTuitionFeeOfStudent(feeCourse - feeCourse / 100 * percentSt);
            studentsRepository.save(item);
        }
        stLeader.setTuitionFeeOfStudent(feeCourse - feeCourse / 100 * percentLeader);
        studentsRepository.save(stLeader);
    }

    @Override
    public boolean update(Students students) {
        try {
            System.out.println(students.toString());
            studentsRepository.save(students);
            return true;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "save-error: {0}", ex.getMessage());
            return false;
        }
    }

    @Override
    public boolean deleted(Students students) {

        try {
            students.setDeleted(false);
            studentsRepository.save(students);
            return true;
        } catch (Exception ex) {
            LOGGER.log(Level.SEVERE, "save-error: {0}", ex.getMessage());
            return false;
        }
    }

}
