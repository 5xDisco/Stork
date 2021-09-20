import { Controller } from "stimulus";
import $ from "jquery";
import 'select2'


export default class extends Controller {
    static targets = [ "formselect" ]

    connect(){

          $(function(){
            $("#user_select").select2({
              placeholder: "搜尋欲邀請成員電子信箱",
              // tags: true,
              // createTag: function (params) {
                
              //   // 如果没有@符号，则不要偏移以创建标记
              //   if (params.term.indexOf('@') === -1) {
              //     // 返回null以禁用标记创建
              //     return null;
              //   }
            
              //   return {
              //     id: params.term,
              //     text: params.term
              //   }
              // }
            });
          });

         
    }
}