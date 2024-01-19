protocol ViewCode {
    func commonInit()
    func setupHierarchy()
    func setupConstraints()
    func setupActions()
    func setupStyle()
}

extension ViewCode {
    func commonInit() {
        setupHierarchy()
        setupConstraints()
        setupActions()
        setupStyle()
    }
    func setupHierarchy() {}
    func setupConstraints() {}
    func setupActions() {}
    func setupStyle() {}
}
