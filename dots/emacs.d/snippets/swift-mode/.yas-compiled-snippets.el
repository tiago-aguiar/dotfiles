;;; Compiled snippets and support files for `swift-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'swift-mode
		     '(("willDisplayHeader" "func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {\n    $0\n}" "swift-willDisplayHeader" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-willDisplayHeader" nil nil)
		       ("subviews" "override func layoutSubviews() {\n    super.layoutSubviews()\n    $0\n}\n" "swift-subviews" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-subviews" nil nil)
		       ("sections" "func numberOfSections(in tableView: UITableView) -> Int {\n     $0\n}\n" "swift-sections" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-sections" nil nil)
		       ("numberOfRows" "func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {\n    $0\n}\n" "swift-numberOfRows" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-numberOfRows" nil nil)
		       ("numberOfItems" "func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {\n     $0    \n}\n\n" "swift-numberOfItems" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-numberOfItems" nil nil)
		       ("initView" "override init(frame: CGRect) {\n    super.init(frame: frame)\n    $0\n}\n\nrequired init?(coder: NSCoder) {\n    fatalError()\n}\n" "swift-initView" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-initView" nil nil)
		       ("heightForRow" "func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {\n     $0\n}" "swift-heightForRow" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-heightForRow" nil nil)
		       ("heightForHeader" "func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {\n    $0\n}\n" "swift-heightForHeader" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-heightForHeader" nil nil)
		       ("didLayout" "override func viewDidLayoutSubviews() {\n    super.viewDidLayoutSubviews()\n    $0\n}\n" "swift-didLayout" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-didLayout" nil nil)
		       ("cellForRow" "func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {\n     $0\n}" "swift-cellForRow" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-cellForRow" nil nil)
		       ("cellForItem" "func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {\n     $0\n}" "swift-cellForItem" nil nil nil "/Users/tiagoaguiar/.emacs.d/snippets/swift-mode/swift-cellForItem" nil nil)))


;;; Do not edit! File generated at Tue Oct 25 18:50:14 2022
