# DropdownTableView 직접 구현
## (SnapKit)

### 설명
- 테이블 뷰 형식의 메뉴를 탭했을 때
- 아래로 세부 메뉴가 나오는 Dropdown을 직접 만들었다
- 셀을 탭하는 것이 아닌 헤더를 탭하는 것
    - `UITapGestureRecognizer`
    - 탭했을 때, section값을 tag값으로 하고 
    - 이 tag값을 delegate로 MainViewController에서 지금 눌려있는 값(`currentTappedSectionIndex`)과 비교
    - 다음 세 가지 경우가 나온다
        - 아무것도 눌려있지 않은 상태에서, 탭하는 경우 (`currentTappedSectionIndex = nil`)
        - 1개가 눌려있는 상태에서, 탭하는 경우 (`currentTappedSectionIndex`는 어떠한 `Int`값을 갖고 있을 것이다)
        - 1개가 눌려있는 상태에서, 열려있는 것을 탭하는 경우(= 같은 것을 누르는 경우) (`currentTappedSectionIndex == tag`)
- 탭 되면 테이블뷰를 reload 하는데
- `currentTappedSectionIndex`을 이용하여
    - 열려있는 섹션의 셀의 개수는 제대로 된 값을 리턴하고
    - 닫혀있는 섹션의 셀의 개수는 0을 리턴하면 된다

### 결과
![](/DropdownTableView/dropdownResult.gif)
