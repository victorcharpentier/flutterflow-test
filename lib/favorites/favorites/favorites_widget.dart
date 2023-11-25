import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'favorites_model.dart';
export 'favorites_model.dart';

class FavoritesWidget extends StatefulWidget {
  const FavoritesWidget({super.key});

  @override
  _FavoritesWidgetState createState() => _FavoritesWidgetState();
}

class _FavoritesWidgetState extends State<FavoritesWidget> {
  late FavoritesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritesModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 100.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<PropertiesRecord>>(
                    stream: queryPropertiesRecord(
                      queryBuilder: (propertiesRecord) =>
                          propertiesRecord.where(
                        'property_liked_by',
                        arrayContains: currentUserReference,
                      ),
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50.0,
                            height: 50.0,
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                FlutterFlowTheme.of(context).primary,
                              ),
                            ),
                          ),
                        );
                      }
                      List<PropertiesRecord> listViewPropertiesRecordList =
                          snapshot.data!;
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewPropertiesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewPropertiesRecord =
                              listViewPropertiesRecordList[listViewIndex];
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 12.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        20.0, 20.0, 20.0, 20.0),
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: Image.network(
                                            listViewPropertiesRecord
                                                .photos.first,
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .width -
                                                32,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              const AlignmentDirectional(1.00, -1.00),
                                          child: Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                    20.0, 4.0, 4.0, 20.0),
                                            child: ToggleIcon(
                                              onPressed: () async {
                                                final propertyLikedByElement =
                                                    currentUserReference;
                                                final propertyLikedByUpdate =
                                                    listViewPropertiesRecord
                                                            .propertyLikedBy
                                                            .contains(
                                                                propertyLikedByElement)
                                                        ? FieldValue
                                                            .arrayRemove([
                                                            propertyLikedByElement
                                                          ])
                                                        : FieldValue
                                                            .arrayUnion([
                                                            propertyLikedByElement
                                                          ]);
                                                await listViewPropertiesRecord
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'property_liked_by':
                                                          propertyLikedByUpdate,
                                                    },
                                                  ),
                                                });
                                                if (listViewPropertiesRecord
                                                        .propertyLikedBy
                                                        .contains(
                                                            currentUserReference) ==
                                                    true) {
                                                  await actions
                                                      .removePropertyFromLikedBy(
                                                    listViewPropertiesRecord
                                                        .reference,
                                                    currentUserReference!,
                                                  );
                                                } else {
                                                  await actions
                                                      .addUserToLikedBy(
                                                    listViewPropertiesRecord
                                                        .reference,
                                                    currentUserReference!,
                                                  );
                                                }
                                              },
                                              value: listViewPropertiesRecord
                                                  .propertyLikedBy
                                                  .contains(
                                                      currentUserReference),
                                              onIcon: const Icon(
                                                Icons.favorite,
                                                color: Color(0xFFCD1C23),
                                                size: 40.0,
                                              ),
                                              offIcon: const Icon(
                                                Icons.favorite_border,
                                                color: Color(0xFFCD1C23),
                                                size: 40.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 466.0,
                                    height: 30.0,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            listViewPropertiesRecord
                                                .propertyName,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyLarge,
                                          ),
                                          const Spacer(),
                                          Text(
                                            '€',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          Text(
                                            listViewPropertiesRecord
                                                .nightlyPrice
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                          Text(
                                            '/night',
                                            style: FlutterFlowTheme.of(context)
                                                .titleLarge,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            listViewPropertiesRecord
                                                .propertyRegion,
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 4.0, 0.0),
                                          child: Text(
                                            listViewPropertiesRecord
                                                .propertyRating
                                                .toString(),
                                            style: FlutterFlowTheme.of(context)
                                                .labelMedium,
                                          ),
                                        ),
                                        Icon(
                                          Icons.star_rounded,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          size: 24.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
