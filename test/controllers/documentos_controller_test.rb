require "test_helper"

class DocumentosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @documento = documentos(:one)
  end

  test "should get index" do
    get documentos_url, as: :json
    assert_response :success
  end

  test "should create documento" do
    assert_difference('Documento.count') do
      post documentos_url, params: { documento: { blob: @documento.blob, nome: @documento.nome } }, as: :json
    end

    assert_response 201
  end

  test "should show documento" do
    get documento_url(@documento), as: :json
    assert_response :success
  end

  test "should update documento" do
    patch documento_url(@documento), params: { documento: { blob: @documento.blob, nome: @documento.nome } }, as: :json
    assert_response 200
  end

  test "should destroy documento" do
    assert_difference('Documento.count', -1) do
      delete documento_url(@documento), as: :json
    end

    assert_response 204
  end
end
